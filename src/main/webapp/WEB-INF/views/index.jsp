<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MVC-WEB Tutorial</title>
    <meta name="description" content="Sample web application built with JSP and Servlets.">
    <meta name="author" content="Your Name">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- Bootstrap 5 -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" rel="stylesheet">

    <style>
        :root {
            --brand-primary: #4f46e5;
            --brand-secondary: #f3f4f6;
            --text-dark: #1f2937;
            --text-muted: #6b7280;
        }
        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--brand-secondary);
            color: var(--text-dark);
        }
        /* Navbar */
        .navbar {
            background-color: var(--brand-primary);
        }
        .navbar-brand, .nav-link {
            color: #fff !important;
            font-weight: 600;
        }
        /* Hero */
        .hero {
            background: url('https://source.unsplash.com/1600x900/?technology') center/cover no-repeat;
            color: #fff;
            padding: 6rem 0;
            text-shadow: 0 2px 8px rgba(0,0,0,0.6);
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: 600;
        }
        .hero p {
            font-size: 1.25rem;
            margin-bottom: 2rem;
        }
        /* News cards */
        .card-news {
            border: none;
            border-radius: .75rem;
            transition: transform .2s, box-shadow .2s;
        }
        .card-news:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        }
        /* Footer */
        footer {
            background-color: var(--text-dark);
            color: #ccc;
            padding: 2rem 0;
        }
        footer a {
            color: #fff;
            margin: 0 .5rem;
            font-size: 1.25rem;
        }
        /* Dark mode toggle */
        .form-check-input:checked + .form-check-label::before {
            background-color: var(--brand-primary) !important;
            border-color: var(--brand-primary) !important;
        }
    </style>
</head>

<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">MVC WEB App</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navMenu" aria-controls="navMenu" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navMenu">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Register</a></li>
            </ul>
            <div class="form-check form-switch text-white ms-4">
                <input class="form-check-input" type="checkbox" id="darkModeSwitch">
                <label class="form-check-label" for="darkModeSwitch">Dark Mode</label>
            </div>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero text-center">
    <div class="container">
        <h1>Welcome to MVC Web Application</h1>
        <p>Explore the features and functionalities built with JSP and Servlets.</p>
        <a href="#" class="btn btn-lg btn-light">Learn More</a>
    </div>
</section>

<!-- Latest News -->
<section class="py-5">
    <div class="container">
        <h2 class="mb-4 text-center">Latest News</h2>
        <div class="row g-4">
            <!-- Card 1 -->
            <div class="col-md-4">
                <div class="card card-news">
                    <img src="https://www.taazaa.com/wp-content/uploads/2024/03/Top_Three_Features_of_ASP_750x420-1.jpg" class="card-img-top" alt="Feature">
                    <div class="card-body">
                        <h5 class="card-title">New Features Released</h5>
                        <p class="card-text">We’ve rolled out an exciting set of features to enhance your experience.</p>
                        <a href="#" class="btn btn-sm btn-primary">Read More</a>
                    </div>
                </div>
            </div>
            <!-- Card 2 -->
            <div class="col-md-4">
                <div class="card card-news">
                    <img src="https://www.syncfusion.com/blogs/wp-content/uploads/2024/12/ASP.NET-MVC-Suite-Update-Aligning-with-.NET-Changes.jpg" class="card-img-top" alt="Update">
                    <div class="card-body">
                        <h5 class="card-title">System Update</h5>
                        <p class="card-text">Our platform received a performance upgrade—faster, smoother, stronger.</p>
                        <a href="#" class="btn btn-sm btn-primary">Details</a>
                    </div>
                </div>
            </div>
            <!-- Card 3 -->
            <div class="col-md-4">
                <div class="card card-news">
                    <img src="https://market-resized.envatousercontent.com/previews/files/631135130/preview.png?w=590&h=300&cf_fit=crop&crop=top&format=auto&q=85&s=431dab77acfd5434c07883fad261630c0a782c6355be9c678fc0e22668c7ce19" class="card-img-top" alt="Team">
                    <div class="card-body">
                        <h5 class="card-title">Meet the Team</h5>
                        <p class="card-text">Get to know the people powering your favorite web app.</p>
                        <a href="#" class="btn btn-sm btn-primary">Learn More</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="text-center">
    <div class="container">
        <p class="mb-2">&copy; 2025 My Web Application. All rights reserved.</p>
        <div>
            <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
            <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
            <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
        </div>
    </div>
</footer>

<!-- Bootstrap 5 JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script>
    // Dark Mode Toggle
    document.getElementById('darkModeSwitch').addEventListener('change', function() {
        document.body.classList.toggle('bg-dark');
        document.body.classList.toggle('text-light');
        document.querySelectorAll('.card-news').forEach(c => c.classList.toggle('bg-secondary'));
    });
</script>
</body>
</html>



