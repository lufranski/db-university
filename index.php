<?php

    echo "<h1>Hello World from SQL</h1>";

    // Define connection parameters
    define("DB_SERVERNAME", "localhost");
    define("DB_USERNAME","root");
    define("DB_PASSWORD", "root");
    define("DB_NAME", "db_university");
    
    // Connect
    $conn = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD, DB_NAME);
    
    // Check connection
    if ($conn && $conn -> connect_error) {
        echo "Connection failed: " . $conn -> connect_error;

        return;
    }

    echo "<h2>Connection ok</h2>";

    $sql = "
    SELECT *
    FROM students
        INNER JOIN degrees
            ON students.degree_id = degrees.id;
    ";
    $result = $conn->query($sql);

    if ($result && $result->num_rows > 0) {
        // output data of each row
        while($row = $result->fetch_assoc()) {
            echo "<div><h2>" . $row['students.name'] .' '. $row['students.surname'] . "</h2>"
            . $row['degrees.name']
            . $row['students.date_of_birth'] . "<br>" . $row['students.enrolment_date'] . "<br>" . $row['students.email']
            . "</div>";
    }
    } elseif ($result) {
        echo "0 results";
    } else {
        echo "query error";
    }

    $conn -> close();

    

?>
