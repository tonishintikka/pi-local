#!/usr/bin/env bash
# Run Pi coding agent in an Apple container.
# Usage: ./run.sh [project-path]
# If no path given, uses current directory.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT="${1:-$(pwd)}"
PROJECT="$(cd "$PROJECT" && pwd)"
OBSIDIAN="${HOME}/Documents/ai_home/obsidian"
IMAGE="pi-local"

# Build image if not present
if ! container images list 2>/dev/null | grep -q "$IMAGE"; then
  echo "Building $IMAGE..."
  container build -t "$IMAGE" -f "$SCRIPT_DIR/Containerfile" "$SCRIPT_DIR"
fi

# Copy AGENTS.md to project if not already present
if [ ! -f "$PROJECT/AGENTS.md" ]; then
  cp "$SCRIPT_DIR/AGENTS.md" "$PROJECT/AGENTS.md"
fi

echo "Starting Pi in: $PROJECT"

container run --rm -it \
  --mount "type=bind,source=$PROJECT,destination=/workspace" \
  --mount "type=bind,source=$SCRIPT_DIR/config,destination=/root/.pi/agent,readonly" \
  --mount "type=bind,source=$OBSIDIAN,destination=/obsidian,readonly" \
  "$IMAGE" \
  pi
