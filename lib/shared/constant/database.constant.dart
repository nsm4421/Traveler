enum Tables {
  users("users"),
  review("review"),
  tripPlan("trip_plan"),
  tripPlanComment("trip_plan_comment"),
  joinApply("join_apply")
  ;

  final String name;

  const Tables(this.name);
}
