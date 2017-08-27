describe("Calendar", function() {
  beforeEach(function() {
    this.describedClass = Calendar;
    this.builderFactory = new Calendar.DayBuilder.Factory;
    this.payments = [{ id: 1 }];
    this.buildJsonCalendar = function() {
      return {
        firstDate: 1325372400000,
        lastDate:  1327964400000,
        payments: this.payments
      };
    };

    this.buildSubject = function() {
      return this.subject = new this.describedClass (
        this.buildJsonCalendar(),
        this.builderFactory
      );
    };

    this.buildSubject();
  });

  describe('#firsDate', function() {
    it('converts firstDate to Date', function(){
      expect(this.subject.firstDate).toEqual(new Date(2012, 0, 1));
    });
  });

  describe('#lastDate', function() {
    it('converts lastDate to Date', function(){
      expect(this.subject.lastDate).toEqual(new Date(2012, 0, 31));
    });
  });

  describe('#payments', function(){
    it ('returns the given payments unwrapped', function() {
      expect(this.subject.payments).toEqual(this.payments);
    });
  });

  describe('#rows', function() {
    describe('when the menth is the beggining of the month is the beginning of the week', function() {
      describe('the first date', function() {
        it('has 5 weeks', function() {
          expect(this.subject.rows.length).toEqual(5);
        });

        it('is the beggining of the month', function() {
          expect(this.subject.rows[0][0]).toEqual({ day: 1 });
        });
      });

      describe('the last date', function() {
        it('is the end of the week after the end of the month', function() {
          expect(this.subject.rows[4][6]).toEqual({ day: 4 });
        });
      });
    });

    describe('when the beggining of the month is in the middle of the week', function(){
      beforeEach(function() {
        this.buildJsonCalendar = function() {
          return {
            firstDate: 1328054400000,
            lastDate:  1330473600000,
            payments: this.payments
          };
        };
        this.buildSubject();
      });

      describe('the first date', function() {
        it('has 5 weeks', function() {
          expect(this.subject.rows.length).toEqual(5);
        });

        it('is within the last month', function() {
          expect(this.subject.rows[0][0]).toEqual({ day: 29 });
        });
      });
      describe('the last date', function() {
        it('is the end of the week after the end of the month', function() {
          expect(this.subject.rows[4][6]).toEqual({ day: 3 });
        });
      });
    });

    describe('when the end of the month matches the end of the week', function(){
      beforeEach(function() {
        this.buildJsonCalendar = function() {
          return {
            firstDate: 1330560000000,
            lastDate:  1333152000000,
            payments: this.payments
          };
        };
        this.buildSubject();
      });

      describe('the first date', function() {
        it('has 5 weeks', function() {
          expect(this.subject.rows.length).toEqual(5);
        });

        it('is within the last month', function() {
          expect(this.subject.rows[0][0]).toEqual({ day: 26 });
        });
      });

      describe('the last date', function() {
        it('is the end of the month', function() {
          expect(this.subject.rows[4][6]).toEqual({ day: 31 });
        });
      });
    });
  });
});
