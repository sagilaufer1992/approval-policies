package env0

# METADATA
# title: requires approval for more than 5 planned resources
# description: require approval on more than 5 planned resources
pending[format(rego.metadata.rule())] {
	count(input.plan.resource_changes) >= 5
	count(input.approvers) == 0
}

# METADATA
# title: allow if approved
# description: allow after approval is given
allow[format(rego.metadata.rule())] {
	count(input.approvers) >= 1
}

# METADATA
# title: allow if less than 5 resources in the plan
# description: approve automatically if the plan has less than 5 resources
allow[format(rego.metadata.rule())] {
	count(input.plan.resource_changes) < 5
}

format(meta) := meta.description
