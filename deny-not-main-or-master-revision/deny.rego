package env0

# METADATA
# description: deny if deployment revision is not "main" or "master"
deny[format(rego.metadata.rule())] {
    allowed_revisions = { "main", "master" }
	not allowed_revisions[input.deploymentRequest.revision]
}

format(meta) := meta.description
