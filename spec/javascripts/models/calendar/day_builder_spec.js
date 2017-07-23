describe("Calendar.DayBuilder", function() {
  enhance(this)

  var describedClass,
      subject, firstDay;

  this.let('firstDay', function() {
    return new Date(2017, 05, 03);
  });


  firstDay = this.values().firstDay;
  beforeEach(function() {
    describedClass = Calendar.DayBuilder;
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
