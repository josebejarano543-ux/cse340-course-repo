
-- CSE 340 W02 - Database Setup
-- Service Network

CREATE TABLE IF NOT EXISTS organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS project (
    project_id SERIAL PRIMARY KEY,
    organization_id INTEGER NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(150) NOT NULL,
    project_date DATE NOT NULL,
    FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
);

CREATE TABLE IF NOT EXISTS category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id)
        REFERENCES project(project_id),
    FOREIGN KEY (category_id)
        REFERENCES category(category_id)
);

-- Organizations
INSERT INTO organization
(name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- Projects
INSERT INTO project
(organization_id, title, description, location, project_date)
VALUES
(1, 'Community Home Repair', 'Repair homes for families in need.', 'Provo, Utah', '2026-11-14'),
(1, 'School Renovation', 'Improve local school facilities.', 'Orem, Utah', '2026-11-18'),
(1, 'Playground Construction', 'Build a playground for children.', 'Lehi, Utah', '2026-11-21'),
(1, 'Community Center Painting', 'Paint a community center.', 'American Fork, Utah', '2026-11-25'),
(1, 'Accessibility Ramp Project', 'Build accessibility ramps.', 'Saratoga Springs, Utah', '2026-12-02'),
(2, 'Community Garden Planting', 'Plant vegetables in a community garden.', 'Provo, Utah', '2026-11-15'),
(2, 'Tree Planting Day', 'Plant trees in local neighborhoods.', 'Orem, Utah', '2026-11-19'),
(2, 'Urban Farming Workshop', 'Teach sustainable gardening.', 'Lehi, Utah', '2026-11-22'),
(2, 'Park Cleanup', 'Clean local parks.', 'American Fork, Utah', '2026-11-28'),
(2, 'Food Sustainability Event', 'Promote sustainable food practices.', 'Provo, Utah', '2026-12-04'),
(3, 'Food Donation Drive', 'Collect food for families.', 'Orem, Utah', '2026-11-16'),
(3, 'Winter Clothing Collection', 'Collect winter clothing.', 'Provo, Utah', '2026-11-20'),
(3, 'Senior Community Support', 'Help local seniors.', 'Lehi, Utah', '2026-11-24'),
(3, 'Student Tutoring Program', 'Tutor local students.', 'American Fork, Utah', '2026-11-30'),
(3, 'Community Health Awareness', 'Promote healthy habits.', 'Orem, Utah', '2026-12-05');

-- Categories
INSERT INTO category (name)
VALUES
('Construction'),
('Environment'),
('Community Service');

-- Project-category relationships
INSERT INTO project_category (project_id, category_id)
VALUES
(1, 1), (2, 1), (3, 1), (4, 1), (5, 1),
(6, 2), (7, 2), (8, 2), (9, 2), (10, 2),
(11, 3), (12, 3), (13, 3), (14, 3), (15, 3);
