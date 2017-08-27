describe('Date', function() {
  beforeEach(function() {
    this.day = 4;
    this.month = 10;

    this.buildSubject = function() {
      return this.subject = new Date(2017, this.month, this.day);
    };

    this.buildSubject();
  });

  describe('.fromString', function() {
    describe('when passing a regular date', function() {
      it('returns the parsed date', function () {
        var string = '2017-10-05';

        expect(Date.fromString(string)).toEqual(new Date(2017, 9, 5));
      });
    });

    describe('when passing an irregular date', function() {
      it('returns the parsed date', function () {
        var string = '2017-10-35';

        expect(Date.fromString(string)).toEqual(new Date(2017, 10, 4));
      });
    });
  });

  describe('#addDays', function() {
    describe('when adding 0 days', function() {
      it('returns the same date', function() {
        expect(this.subject.addDays(0)).toEqual(this.subject);
      });
    });

    describe('when adding 1 days', function() {
      it('returns the next day', function() {
        expect(this.subject.addDays(1)).toEqual(new Date(2017, 10, 5));
      });
    });

    describe('when adding -1 days', function() {
      it('returns the previous day', function() {
        expect(this.subject.addDays(-1)).toEqual(new Date(2017, 10, 3));
      });
    });

    describe('when adding a whole month', function() {
      it('returns the same day on next month', function() {
        expect(this.subject.addDays(30)).toEqual(new Date(2017, 11, 4));
      });
    });
  });

  describe('#beginingOfWeek', function() {
    describe('when date is one day after monday', function() {
      beforeEach(function() {
        this.day = 7;

        this.buildSubject();
      });

      it('returns the beginning of the week as monday', function() {
        expect(this.subject.beginningOfWeek().getDay()).toEqual(0);
      });

      it('returns the beginning of the week date', function() {
        expect(this.subject.beginningOfWeek()).toEqual(new Date(2017, 10, 5));
      });
    });

    describe('when date is sunday', function() {
      beforeEach(function() {
        this.day = 5;

        this.buildSubject();
      });

      it('returns the beginning of the week as monday', function() {
        expect(this.subject.beginningOfWeek().getDay()).toEqual(0);
      });

      it('returns the same day', function() {
        expect(this.subject.beginningOfWeek()).toEqual(this.subject);
      });
    });

    describe('when date is saturday', function() {
      beforeEach(function() {
        this.day = 11;

        this.buildSubject();
      });

      it('returns the beginning of the week as monday', function() {
        expect(this.subject.beginningOfWeek().getDay()).toEqual(0);
      });

      it('returns the previous sunday', function() {
        expect(this.subject.beginningOfWeek()).toEqual(new Date(2017, 10, 5));
      });
    });
  });
});
