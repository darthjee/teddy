describe("Calendar.IndexController", function() {
  beforeEach(function() {
    var that = this;

    this.describedClass = Calendar.IndexController;
    this.location = { $$path: '/year/2012/month/1' };
    this.dayBuilderFactory = Calendar.DayBuilder.Factory();
    this.builder = Calendar.Factory(this.dayBuilderFactory);

    this.response = {
      data: {
        firstDate: 1422748800000,
        lastDate:  1425081600000,
        payments: []
      }
    };
    this.buildResponse = function() {
      return this.response;
    };

    this.promise = new Deferred();

    this.http = { get: function() { return that.promise } };

    this.requester = new Global.GenericRequesterService(this.location, this.http);

    this.buildSubject = function() {
      return this.subject = new this.describedClass(
        this.requester,
        this.notifier,
        this.builder
      );
    };

    this.buildSubject();
    this.promise.resolve(this.buildResponse());
  });

  describe('when everything is a success', function() {
    it('builds a calendar', function() {
      expect(this.subject.calendar.rows.length).toEqual(4);
    });
  });
});

