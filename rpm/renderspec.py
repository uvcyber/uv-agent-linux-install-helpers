#!/usr/bin/env python3
import yaml
import sys
from jinja2 import Environment, FileSystemLoader, select_autoescape
from typing import Any
from pprint import pprint
from pathlib import Path
import os.path


config = {
    "output_path": "/root/rpmbuild/SPECS",
    "template": "./rpm-spec-template.j2",
}

if __name__ == "__main__":
    env = Environment(loader=FileSystemLoader("."), autoescape=select_autoescape())
    template = env.get_template("rpm-spec-template.j2")

    with open(sys.argv[1], "rt") as infile:
        config = {**config, **yaml.safe_load(infile)}

    outp = Path(config["output_path"])
    outp.mkdir(0o770, parents=True, exist_ok=True)

    for item in config.get("locations", {}):
        itemconfig: dict[str:Any] = dict(**config.get("defaults", {}), **item)

        outname = os.path.join(
            config["output_path"], f"uvcyber-agent-bootstrap-{item['name']}.spec"
        )
        with open(outname, "wt") as outfile:
            print(f"writing config for {item['name']} to {outname}\n")
            print(template.render(itemconfig), file=outfile)
