package env0

# METADATA
# title: require 3 approvals
# description: At least 3 approvals must be given.
pending[format(rego.metadata.rule())] {
	count(input.approvers) < 3
}

# METADATA
# title: more than 3 approvals
# description: allow if 3 or more approvals are given.
allow[format(rego.metadata.rule())] {
	count(input.approvers) >= 3
}

format(meta) := meta.description
