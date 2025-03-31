enum Tables {
  users("users"),
  tripPlan("trip_plan"),
  tripPlanComment("trip_plan_comment"),
  joinApply("join_apply")
  ;

  final String name;

  const Tables(this.name);
}
