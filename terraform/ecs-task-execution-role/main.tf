module "ecs_task_execution_role" {
  source = "../service-role"
  policy_document = {
    actions = var.ecs_task_execution_role.policy_document.actions
    effect = var.ecs_task_execution_role.policy_document.effect
    type = var.ecs_task_execution_role.policy_document.type
    identifiers = var.ecs_task_execution_role.policy_document.identifiers
  }
  iam_role_name = var.ecs_task_execution_role.iam_role_name
  iam_policy_arn = var.ecs_task_execution_role.iam_policy_arn
}

#TODO CloudWatch log groups