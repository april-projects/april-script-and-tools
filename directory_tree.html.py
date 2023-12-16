import os

def generate_tree_html(directory):
    tree_html = '<ul>'
    for root, dirs, files in os.walk(directory):
        root_path = os.path.relpath(root, directory)
        tree_html += f'<li><a href="#">{root_path}</a>'

        if dirs or files:
            tree_html += '<ul>'

            for file in files:
                tree_html += f'<li>{file}</li>'

            tree_html += '</ul>'

        tree_html += '</li>'

    tree_html += '</ul>'
    return tree_html

def generate_interactive_tree(directory, output_file='directory_tree.html'):
    tree_html = f'''
    <!DOCTYPE html>
    <html>
    <head>
        <title>Directory Tree</title>
        <style>
            ul {{ list-style-type: none; padding-left: 1em; }}
            li {{ margin-bottom: 0.5em; cursor: pointer; }}
            a {{ text-decoration: none; color: #007bff; }}
        </style>
    </head>
    <body>
        <h1>Directory Tree</h1>
        {generate_tree_html(directory)}
        <script>
            document.addEventListener('DOMContentLoaded', function() {{
                var items = document.querySelectorAll('li');
                items.forEach(function(item) {{
                    item.addEventListener('click', function() {{
                        item.classList.toggle('expanded');
                    }});
                }});
            }});
        </script>
    </body>
    </html>
    '''

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(tree_html)

if __name__ == '__main__':
    generate_interactive_tree('.')