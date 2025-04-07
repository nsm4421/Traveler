enum Tables {
  users("users"),
  review("review"),
  tripPlan("trip_plan"),
  tripPlanComment("trip_plan_comment"),
  joinApply("join_apply");

  final String name;

  const Tables(this.name);
}

enum Buckets {
  auth("auth"),
  review("review");

  final String name;

  const Buckets(this.name);
}
