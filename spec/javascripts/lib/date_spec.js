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
});
