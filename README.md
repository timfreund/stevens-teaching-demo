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
- Patients can have any number of **ailments**
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
