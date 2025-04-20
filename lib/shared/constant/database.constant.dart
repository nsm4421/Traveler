enum Tables {
  users("users"),
  review("review"),
  reviewComment("review_comment"),
  tripPlan("trip_plan"),
  tripPlanComment("trip_plan_comment"),
  joinApply("join_apply");

  final String name;

  const Tables(this.name);
}

enum Buckets {
  avatar(id: "avatar", name: "avatar", public: false),
  review(id: "review", name: "review", public: false);

  final String id;
  final String name;
  final bool public;

  const Buckets({required this.id, required this.name, this.public = false});
}
