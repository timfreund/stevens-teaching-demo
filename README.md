# CNSA Instructor Interview
## Interview Prompt
**Objective:**
1. Use basic conceptual models such as the entity relationship (E-R) model for database design

**Overview:**

Doctor’s Scenario:
XYZ Inc. is a small doctor’s office in the heart of downtown. The office comprises of
several doctors/physicians that are specialized in various areas such as Pediatrics,
Gynecology, ENT, etc. Patients can visit one or many of those doctors. When a patient
visits a doctor and a payment is made, the amount is charged to that patient’s account. A
patient can be diagnosed with one or many ailments (headache, fever, cancer, etc). A
record is kept of each patient’s visit as well as his or her date of birth for any medication
to be prescribed.

Requirements:
(a) The physician attributes include name, gender, salary, specialty, etc.;
(b) The patient’s attributes include name, date of birth, account balance and gender;
(c) A patient can see one or more doctors;
(d) Payment can be made in several ways including visa (other forms), check or cash;
(e) A patient can be diagnosed with one or more ailments;
(f) For each patient visit, the patient’s balance amount is updated;
(g) Display a patient’s visit and his/her diagnosis(es);
(h) Display summary of visits by diagnosis;

Using a software of your choice create a UML and an Entity-Relationship Diagram of the above
scenario explaining the decision of how you arrive at your final answer.







## Concepts to cover

- Why learn relational databases?
- Problem Decomposition
  - What types of things do we need to track?
  - How many of each of those types exist?
  - What are their relationships to each other?
- Entities / Tables
- Attributes / Columns
- Relationships and cardinality
- Changes over time

## Why learn relational databases?

Every organization runs on databases. Sometimes those databases are
disguised as spreadsheets, but with enough time and growth those
spreadsheets will start to buckle under the size of the data or the
need to connect data together, or the need to report on the data.

Every tech worker will bump up against those databases to varying
degrees. Database administrators and developers, obviously.  Developers
need to connect their applications to databases.  Network engineers
need to protect access to database systems.

Relational databases and SQL are technologies that have been around
for decades and will be around for decades.

If a disaster destroys your servers, you can rebuild.  If a disaster
destroys your data, you're sunk.

## Problem Decomposition

Designing a database schema is a little like working on a word problem
in math class: some terms are more important than others, and it takes
some practice to figure out which things matter.  For our first pass
through the overview, let's pull out a list of the things that we
need to track:

- There is an **office**.
- There are several **doctors**
  - Doctors have specialties
- The practice has **patients**
  - Patients can see one or many doctors
- Patients have **accounts**
- Patients make **payments** on their accounts
- Patients can be **diagnosed** with any number of **ailments**
- Patient **visits** are tracked
- Patient **medication** is tracked

It's also worth noting that sometimes information in a customer
specification doesn't matter.  In this case, we see that it's a
doctor's office "in the heart of downtown."  Does the office's
downtownness impact our database design?  No: it would be the same
even if it was a rural clinic.

Before we dig further into the requirements, let's put together
a very simple diagram to show our types, and their connections
to one another.  This is a first pass, and we'll get more specific
in the next pass.

TKTK: diagram from notebook

## Entities / Tables

Each kind of thing we want to track in our system is represented
by an entity, also known as a table, in our database.  So there will be a
Patient table, and each patient will be represented as a row
in that table.

Each entity has attributes, and those attributes are columns on the
tables.  This is why spreadsheets often fill in for real databases
in many small organizations: there's a lot of similar concepts.
Databases take things to a level that spreadsheets cannot, though.
In a spreadsheet you can put whatever data you want in to each column.
In a database, we define types and constraints on attributes.

Let's read through the scenario and requirements again, and let's
capture the attributes required for each entity:

### Doctor
- Name
- Gender
- Salary
- Speciality

### Patient
- Name
- Gender
- Date of Birth
- Balance

### Payment
- Amount
- Form

### Ailment
- Name

### Diagnosis
- Diagnosis date
- Notes



## Background on Approach and Tooling

### Version Control

This project is managed with [Git](https://git-scm.com/) and
a private [GitLab](https://about.gitlab.com/) instance with
a public mirror on [GitHub](https://github.com/timfreund/stevens-teaching-demo).

Version control systems are free and ubiquitous, and they run locally
with or without a server. Version control was previously used
primarily by software engineering teams in the past, but now all
technical teams can reap the benefits of detailed change history.
The most effective SRE team I worked on defined all infrastructure
as code and they managed changes to that code in Gitlab.

On a practical level for our students, encouraging the use of version
control early and often will help them build a habit that will
pay dividends throughout their career regardless of the specific
technologies they are using.

### PostgreSQL

I've used many relational databases including Oracle, MSSQL, MySQL,
and Sqlite.  I choose [PostgreSQL](https://www.postgresql.org/) in
cases where there are no constraints that would steer me toward
another solution.  It has a long history of favoring correctness over
performance, and they've made tremendous progress on the performance
front in the past decade.  It is open source so it can be deployed as
often as necessary without legal or licensing concerns.  Many
organizations are rethinking their database vendor choices as
proprietary and open source systems reach relative feature parity
while the proprietary system license fees continue to grow.  My last
two employers were actively considering moves from MSSQL to
PostgreSQL, and my last employer had guidance in place to not pursue
acquisitions if the target company relied on MSSQL.

### Docker Compose

In other areas of the CNSA program students will presumably
build systems from scratch including database servers.  Since
this teaching sample is covering database design, I wanted
a lab environment that was easy and consistent to provision,
and just as easy to destroy and recreate.

### D2 for Diagrams

[D2](https://d2lang.com/) is an open source tool that transforms plain
text into diagrams.  This lets us generate diagrams automatically in
continuous integration pipelines and helps alleviate the biggest
problem with documentation in industry: drift from reality.
