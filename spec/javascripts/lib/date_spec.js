describe('Date', function() {
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
    beforeEach(function() {
      this.subject = new Date(2017, 10, 4);
    });

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
});
