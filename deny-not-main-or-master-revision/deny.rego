package env0

# METADATA
# title: deny destroys
# description: destroys are not allowed in this project
deny[format(rego.metadata.rule())] {
    allowed_revisions = ["main", "master"]
	not allowed_revisions[input.deploymentRequest.revision]
}

format(meta) := meta.description
