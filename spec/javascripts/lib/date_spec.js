describe('Date', function() {
  beforeEach(function() {
    this.day = 4;
    this.month = 10;
    this.dateMonth = this.month;
    this.dateDay = this.day;

    this.buildDate = function() {
      this.date = new Date(2017, this.dateMonth, this.dateDay);
    };
    this.buildSubject = function() {
      return this.subject = new Date(2017, this.month, this.day);
    };

    this.buildSubject();
    this.buildDate();
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

  describe('#endOfWeek', function() {
    describe('when date is one day before friday', function() {
      beforeEach(function() {
        this.day = 9;

        this.buildSubject();
      });

      it('returns the end of the week as monday', function() {
        expect(this.subject.endOfWeek().getDay()).toEqual(6);
      });

      it('returns the end of the week date', function() {
        expect(this.subject.endOfWeek()).toEqual(new Date(2017, 10, 11));
      });
    });

    describe('when date is saturday', function() {
      beforeEach(function() {
        this.day = 11;

        this.buildSubject();
      });

      it('returns the end of the week as monday', function() {
        expect(this.subject.endOfWeek().getDay()).toEqual(6);
      });

      it('returns the same day', function() {
        expect(this.subject.endOfWeek()).toEqual(this.subject);
      });
    });

    describe('when date is sunday', function() {
      beforeEach(function() {
        this.day = 5;

        this.buildSubject();
      });

      it('returns the end of the week as monday', function() {
        expect(this.subject.endOfWeek().getDay()).toEqual(6);
      });

      it('returns the next saturday', function() {
        expect(this.subject.endOfWeek()).toEqual(new Date(2017, 10, 11));
      });
    });
  });

  describe('#daysUntil', function() {
    describe('when using the same date', function() {
      it('returns 0', function() {
        expect(this.subject.daysUntil(this.date)).toEqual(0);
      });
    });

    describe('when using a one day ahead date', function() {
      beforeEach(function() {
        this.dateDay = this.day + 1;
        this.buildDate();
      });

      it('returns 1', function() {
        expect(this.subject.daysUntil(this.date)).toEqual(1);
      });
    });

    describe('when using a one day before date', function() {
      beforeEach(function() {
        this.dateDay = this.day - 1;
        this.buildDate();
      });

      it('returns -1', function() {
        expect(this.subject.daysUntil(this.date)).toEqual(-1);
      });
    });

    describe('when using the same day for the next month', function() {
      beforeEach(function() {
        this.dateMonth = this.month + 1;
        this.buildDate();
      });

      it('returns the full month', function() {
        expect(this.subject.daysUntil(this.date)).toEqual(30);
      });
    });

    describe('when using the same day for 2 months ahead', function() {
      beforeEach(function() {
        this.dateMonth = this.month + 2;
        this.buildDate();
      });

      it('returns 61 days', function() {
        expect(this.subject.daysUntil(this.date)).toEqual(61);
      });
    });
  });

  describe('#isAfter', function() {
    describe('when using the same date', function() {
      it('returns false', function() {
        expect(this.subject.isAfter(this.date)).toBeFalsy();
      });
    });

    describe('when using the day before', function() {
      beforeEach(function() {
        this.dateDay = this.day - 1;
        this.buildDate();
      });

      it('returns false', function() {
        expect(this.subject.isAfter(this.date)).toBeTruthy();
      });
    });

    describe('whien using a day after', function() {
      beforeEach(function() {
        this.dateDay = this.day + 1;
        this.buildDate();
      });

      it('returns false', function() {
        expect(this.subject.isAfter(this.date)).toBeFalsy();
      });
    });

    describe('when using the month before', function() {
      beforeEach(function() {
        this.dateMonth = this.month - 1;
        this.buildDate();
      });

      it('returns false', function() {
        expect(this.subject.isAfter(this.date)).toBeTruthy();
      });
    });

    describe('whien using a month after', function() {
      beforeEach(function() {
        this.dateMonth = this.month + 1;
        this.buildDate();
      });

      it('returns false', function() {
        expect(this.subject.isAfter(this.date)).toBeFalsy();
      });
    });
  });
});
