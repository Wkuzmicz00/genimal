
def generate_raport(data: str) -> None:
    html_content = '''
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Animal Report</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }
            .animal {
                border: 1px solid #ccc;
                padding: 10px;
                margin: 10px;
                display: inline-block;
                text-align: center;
            }
            .animal img {
                max-width: 100px;
                max-height: 100px;
            }
            .animal h2 {
                margin: 5px 0;
            }
            .animal p {
                margin: 5px 0;
                font-size: 14px;
            }
        </style>
    </head>
    <body>
        <h1>Animal Report</h1>
    '''

    for animal in data:
        html_content += f'''
        <div class="animal">
            <h2>{animal['name'].capitalize()}</h2>
            <img src="{animal['image_path']}" alt="{animal['name']}">
            <p>Percent: {animal['percent']}%</p>
        </div>
        '''

    html_content += '''
    </body>
    </html>
    '''

    with open("animal_report.html", "w") as html_file:
        html_file.write(html_content)

    print("HTML report 'animal_report.html' created successfully.")