package env0

# METADATA
# description: allows automatically if no other rule overrides
allow[format(rego.metadata.rule())]

format(meta) := meta.description
