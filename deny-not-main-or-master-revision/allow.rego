package env0

# METADATA
# title: allow by default
# description: allows automatically if no other rule overrides
allow[format(rego.metadata.rule())]

format(meta) := meta.description
