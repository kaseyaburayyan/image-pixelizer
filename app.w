bring cloud;

let bucket_props = cloud.BucketProps{public: true};
let bucket = new cloud.Bucket(bucket_props);

bucket.add_object("index.html", "<h1>Go fuck yourself</h1>");

let api = new cloud.Api();
api.get("/test", inflight (request: Json): cloud.ApiResponse => {
    return cloud.ApiResponse{
        body: "Cabbagbe",
        status: 200
    };
});

let website = new cloud.Website();

website.path("./build");