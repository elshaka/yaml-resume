# yaml-resume

Write your resume following some random conventions I came up with (see resume.yml) and output it to STDOUT or JSON.

## Things to implement eventually
- LaTeX output (and PDF from that)
- Filtering for relevant experiences by required skills for a particular job offer
- API integration with services like LinkedIn

## Installation

    bundle install

## Usage

YAML to STDOUT:

    bundle exec ruby yaml2stdout.rb [YAML_RESUME_PATH]

YAML to JSON

    bundle exec ruby yaml2json.rb [YAML_RESUME_PATH] [JSON_RESUME_PATH]
