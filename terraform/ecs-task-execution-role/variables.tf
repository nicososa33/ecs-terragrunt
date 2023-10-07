variable "ecs_task_execution_role" {
  type = object({
    policy_document = object({
      actions = list(string)
      effect = string
      type = string
      identifiers = list(string)
    })
    iam_role_name = string
    iam_policy_arn = string
  })
}
