package env0

# METADATA
# title: only admin can approve more than 5 planned resources
# description: require approval on more than 5 planned resources
pending[format(rego.metadata.rule())] {
	input.plan.planned_values.resources > 5
	count(input.approvers) < 1
}

# METADATA
# title: Admin is allowed to approve
# description: admin is allowed to approve any deployment
allow[format(rego.metadata.rule())] {
	count(input.approvers) > 1
}

# METADATA
# title: allow if less than 5 resources in the plan
# description: approve automatically if the plan has less than 5 resources
allow[format(rego.metadata.rule())] {
	input.plan.planned_values.resources <= 5
}

format(meta) := meta.description
