describe("Calendar.DayBuilder", function() {
  beforeEach(function() {
    this.describedClass = Calendar.DayBuilder;
    this.firstDay = new Date(2017, 05, 03);

    this.buildSubject = function() {
      return new this.describedClass(this.firstDay);
    }
  });

  describe('#build', function() {
    describe('when passing 0 days as argument', function() {
      it('returns the first day from construction', function() {
        with(this) {
          var subject = this.buildSubject();
          expect(subject.build(0)).toEqual({ day: firstDay.getDate() });
        }
      });

      describe ('when passing the whole month as argument', function(){
        it ('returns the same day', function() {
          with(this) {
            var subject = this.buildSubject();
            expect(subject.build(30)).toEqual({ day: firstDay.getDate() });
          }
        });
      });
    });
  });
});
