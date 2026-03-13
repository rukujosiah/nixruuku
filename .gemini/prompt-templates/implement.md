## Implementation: [FEATURE NAME]

### Context
[Copy relevant 3-4 lines from session-context.md]

### Specific Change
File: `modules/nixos/[module].nix`
Action: [replace/add/remove]
Details: [specific code or pattern]

### Verification Required
- [ ] `nix build .#nixosConfigurations.nixruuku.config.system.build.toplevel --dry-run`
- [ ] Specific test: [what you'll check after switch]

### Rollback Plan
If this fails: [how to revert]
