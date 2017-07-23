describe("Calendar.DayBuilder", function() {
  var describedClass,
      subject, firstDay;

  beforeEach(function() {
    describedClass = Calendar.DayBuilder;
    firstDay = new Date(2017, 05, 03);
    subject = new describedClass(firstDay);
  });

  describe('#build', function() {
    describe('when passing 0 days as argument', function() {
      it('returns the first day from construction', function() {
        expect(subject.build(0)).toEqual({ day: firstDay.getDate() });
      });
    });
  });
});
