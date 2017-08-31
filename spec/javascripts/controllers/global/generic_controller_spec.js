describe("Global.GenericController", function() {
  beforeEach(function() {
    var that = this;

    this.describedClass = Global.GenericController;
    this.location = { $$path: '/json.json' };

    this.data = { value: 10 };
    this.response = {
      data: this.data
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
        this.notifier
      );
    };

    this.buildSubject();
    this.promise.resolve(this.buildResponse());
  });

  describe('when everything is a success', function() {
    it('builds data', function() {
      expect(this.subject.data).toEqual(this.data);
    });
  });
});

