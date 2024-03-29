pages_dir := pages
posts_dir := posts
output_dir := docs

markdown_pages := $(wildcard $(pages_dir)/*.md)
markdown_posts := $(wildcard $(posts_dir)/*.md)

header_file = header.html
footer_file = footer.html

# Main markdown pages
generated_files := $(foreach page,$(markdown_pages),$(patsubst $(pages_dir)/%.md,$(output_dir)/%.html,$(page)))
# Append posts pages
generated_files += $(foreach post,$(markdown_posts),$(patsubst $(posts_dir)/%.md,$(output_dir)/%.html,$(post)))

.DEFAULT: compile

compile: $(generated_files)

$(generated_files): $(header_file) $(footer_file) $(markdown_pages) $(markdown_posts)
	ssb -e $(header_file) -f $(footer_file) -p $(posts_dir) -o $(output_dir) $(markdown_pages)

.PHONY: clean

clean:
	rm -f $(generated_files)
