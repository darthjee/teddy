describe("Calendar", function() {
  beforeEach(function() {
    this.describedClass = Calendar;
    this.builderFactory = new Calendar.DayBuilder.Factory;
    this.payments = [{ id: 1 }]
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
  });

  describe('#firsDate', function() {
    it('converts firstDate to Date', function(){
      this.buildSubject();

      expect(this.subject.firstDate).toEqual(new Date(2012, 0, 1));
    });
  });

  describe('#lastDate', function() {
    it('converts lastDate to Date', function(){
      this.buildSubject();

      expect(this.subject.lastDate).toEqual(new Date(2012, 0, 31));
    });
  });

  describe('#payments', function(){
    it ('returns the given payments unwrapped', function() {
      this.buildSubject();

      expect(this.subject.payments).toEqual(this.payments);
    });
  });
});
