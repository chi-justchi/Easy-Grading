# Automated Grading Preprocessing Scripts

This project contains a set of Bash scripts designed to automate the preprocessing steps for grading programming assignments. As a Teaching Assistant (TA), this project will help you save time and reduce manual effort during the grading process.

---

## Overview of Scripts

1. **`unzip.sh`**  
   Unzips all `.zip` files in the current directory into separate folders named after the zip files.

2. **`replaceTester.sh`**  
   Replaces all instances of `FileSystemTester.cpp` in student directories with a master tester file (`GeneralFileSystemTester.cpp`).

3. **`collectSubmissionFiles.sh`**  
   Collects `FileSystem.cpp` files from student directories and renames them using a unique identifier (e.g., the student's full name).

4. **`runAll.sh`**  
   Compiles and runs each student's `FileSystem.cpp` file along with other `.cpp` files in the same directory. Captures the output or compilation errors for grading.

---

## Setup

1. Ensure you have the following installed on your system:

   - Bash (default on macOS and Linux)
   - `g++` (for compiling C++ code)
   - `unzip` (for extracting zip files)

2. Place all the scripts in the same directory as the student submission `.zip` files.

3. Add the master tester file (`GeneralFileSystemTester.cpp`) to the same directory.

---

## Usage

### 1. Unzipping Submissions

Run the `unzip.sh` script to extract all `.zip` files into separate folders:

```bash
[unzip.sh](http://_vscodecontentref_/0)
```

### 2. Replacing Tester Files

Run the replaceTester.sh script to replace all FileSystemTester.cpp files in student directories with the master tester file:

[replaceTester.sh](http://_vscodecontentref_/1)

### 3. Collecting Submission Files

Run the collectSubmissionFiles.sh script to gather all FileSystem.cpp files into a single folder (collected_cpp_files) for easier access:

[collectSubmissionFiles.sh](http://_vscodecontentref_/2)

### 4. Compiling and Running Code

Run the runAll.sh script to compile and execute each student's code. The script will:

Compile all .cpp files in each student's directory.
Capture the output or compilation errors in a file named <student_id>\_output.txt inside the output folder.

[runAll.sh](http://_vscodecontentref_/3)

## Output

- collected_cpp_files/: Contains all FileSystem.cpp files renamed with unique identifiers.
- output/: Contains the output or compilation errors for each student's code in separate files.

## Notes

- Ensure that the folder structure of student submissions is consistent (e.g., each submission is in its own folder).
- The runAll.sh script assumes that all .cpp files in a student's directory should be compiled together.
- If a student's code fails to compile, the error messages will be saved in the corresponding output file.
