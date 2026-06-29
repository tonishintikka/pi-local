# pi-local

Pi coding agent in an Apple native container with local Ollama models.

## Vaatimukset

- macOS 26 Tahoe + Apple container runtime (`brew install container`)
- Ollama käynnissä hostilla (portti 11434)
- Haluamasi mallit ladattuna Ollamaan

## Käyttö

```bash
# Nykyinen hakemisto
./run.sh

# Tietty projekti
./run.sh ~/oma-projekti
```

Container rakentuu automaattisesti ensimmäisellä kerralla.

## Mallit

Muokkaa `models.json` — lisää tai poista malleja:

```json
{ "id": "qwen2.5-coder:32b" }
```

## Obsidian vault

Vault mountataan read-only osoitteeseen `/obsidian/` — hae kontekstia Pissä:

```
rg "hakusana" /obsidian/
```

## Networking

Ollama kuuntelee hostilla. Containerista host näkyy osoitteessa `192.168.64.1`.
