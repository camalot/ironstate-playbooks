# Default nushell config from ansible-systems.
# `source` in nu is parse-time — files referenced below must exist or startup fails.
# Other roles add their own `source` lines via lineinfile.

source ~/.config/nushell/custom/aliases/default.nu
source ~/.config/nushell/custom/exports/default.nu
source ~/.config/nushell/custom/functions/default.nu
source ~/.config/nushell/custom/sources/default.nu
