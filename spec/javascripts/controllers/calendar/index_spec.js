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

    this.promise = new Promise(function(resolve, fail){
      resolve(that.buildResponse());
    });

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
  });

  describe('', function() {
    it('builds a calendar', function() {
      console.info('a');
      expect(this.subject.calendar.rows.length).toEqual(4);
    });
  });
});

