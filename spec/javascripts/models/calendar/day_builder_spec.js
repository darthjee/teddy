describe("Calendar.DayBuilder", function() {
  var subject, firstDay;

  beforeEach(function() {
    firstDay = new Date(2017, 05, 03);
    subject = new Calendar.DayBuilder(firstDay);
  });

  describe('#build', function() {
    describe('when passing 0 days as argument', function() {
      it('returns the first day from construction', function() {
        expect(subject.build(0)).toEqual({ day: firstDay.getDate() });
      });
    });
  });
});
