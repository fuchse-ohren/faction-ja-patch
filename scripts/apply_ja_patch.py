#!/usr/bin/env python3
import csv
from pathlib import Path

rule_file = Path("rules/translation_rules.tsv")
base_dir = Path("vendor/faction/WebContent/WEB-INF/jsp")


def read_rules(path: Path):
    file_rule_map = {}
    with path.open("r", encoding="utf-8") as f:
        reader = csv.DictReader(f, delimiter="\t")
        for row in reader:
            file_text = (row.get("filepath") or "").strip()
            en = row.get("source_en") or ""
            ja = row.get("target_ja") or ""
            if not file_text or not en or not ja:
                continue
            rule_pair = (en.lstrip(), ja.lstrip())
            file_rule_map.setdefault(file_text, {})[rule_pair[0]] = rule_pair[1]
    return file_rule_map


def patch_text(text: str, line_map):
    new_lines = []

    for old_line in text.splitlines(keepends=True):
        body = old_line[:-1] if old_line.endswith("\n") else old_line
        indent_len = len(body) - len(body.lstrip(" \t"))
        indent = body[:indent_len]
        no_indent = body[indent_len:]

        if no_indent in line_map:
            new_body = indent + line_map[no_indent]
        else:
            new_body = body

        if old_line.endswith("\n"):
            new_lines.append(new_body + "\n")
        else:
            new_lines.append(new_body)

    return "".join(new_lines)


def resolve_path(file_text: str):
    raw_path = Path(file_text)
    if raw_path.is_absolute():
        return raw_path
    path_from_base = base_dir / raw_path
    if path_from_base.exists():
        return path_from_base
    return Path(file_text)


def main():
    if not rule_file.exists():
        raise SystemExit(f"rule file not found: {rule_file}")
    if not base_dir.exists():
        raise SystemExit(f"target dir not found: {base_dir}")

    file_rule_map = read_rules(rule_file)

    changed = 0
    for file_text, line_map in file_rule_map.items():
        file_path = resolve_path(file_text)
        if not file_path.exists() or not file_path.is_file():
            continue
        old = file_path.read_text(encoding="utf-8", errors="ignore")
        new = patch_text(old, line_map)
        if new != old:
            file_path.write_text(new, encoding="utf-8")
            changed += 1

    print(f"patched files: {changed}")


if __name__ == "__main__":
    main()
