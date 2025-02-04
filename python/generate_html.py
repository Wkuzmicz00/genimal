def generate_raport(data: list) -> None:
    html_content = '''
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Animal Report</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            margin: 0;
            padding: 20px;
            color: #333;
        }
        h1 {
            color: #fff;
            font-size: 36px;
            margin-bottom: 30px;
            text-align: center;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 30px;
            max-width: 1200px;
            margin: auto;
        }
        .group {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
            padding: 10px;
        }
        .group-number {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }
        .animal {
            background: white;
            border-radius: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 280px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .animal:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.3);
        }
        .animal img {
            max-width: 100%;
            height: 180px;
            border-radius: 15px;
            object-fit: cover;
            margin-bottom: 15px;
        }
        .animal h2 {
            margin: 10px 0;
            font-size: 22px;
            color: #444;
        }
        .animal p {
            font-size: 18px;
            color: #666;
            font-weight: bold;
        }
        @media (max-width: 768px) {
            .animal {
                width: 90%;
            }
        }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <h1>Animal Report</h1>
    <div class="container">
    '''

    for index, animal in enumerate(data, start=1):
        html_content += f'''
        <div class="group">
            <div class="group-number">Number {index}</div>
            <div class="animal">
                <h2>{animal['name'].capitalize()}</h2>
                <img src="{animal['image_path']}" alt="{animal['name']}">
                <p>Percent: {animal['percent']}%</p>
            </div>
        </div>
        '''

    html_content += '''
    </div>
</body>
</html>
    '''

    with open("animal_report.html", "w") as html_file:
        html_file.write(html_content)

    print("HTML report 'animal_report.html' created successfully.")
