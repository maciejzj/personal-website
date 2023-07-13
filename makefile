markdown_pages := index.md work.md
posts_dir := posts
output_dir := docs

markdown_posts := $(wildcard $(posts_dir)/*.md)

# Main markdown pages
generated_files := $(markdown_pages:%.md=%.html)
# Append posts pages
generated_files += $(patsubst $(posts_dir)/%.md,%.html,$(markdown_posts))

.DEFAULT: compile

compile: $(generated_files)

$(generated_files): $(markdown_pages) $(markdown_posts)
	ssb -p $(posts_dir) $(markdown_pages)

.PHONY: clean

clean:
	rm -f $(generated_files)
