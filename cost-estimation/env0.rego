package env0

has_key(x, k) {
	_ = x[k]
}

# METADATA
# title: require approval on cost estimation
# description: require approval if cost estimation is returning any value on the plan
pending[format(rego.metadata.rule())] {
	has_key(input.costEstimation, "totalMonthlyCost")
	count(input.approvers) == 0
}

# METADATA
# title: allow if approved
# description: allow after approval is given
allow[format(rego.metadata.rule())] {
	count(input.approvers) >= 1
}

# METADATA
# title: allow if no monthly cost
# description: approve automatically if the plan no cost estimation
allow[format(rego.metadata.rule())] {
	not has_key(input, "costEstimation")
}

format(meta) := meta.description
