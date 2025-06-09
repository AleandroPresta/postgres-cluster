CREATE DATABASE db;

CREATE TABLE documents (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    content TEXT NOT NULL
);

INSERT INTO documents (name, content)
VALUES (
    'Lorem Ipsum',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam mollis sed quam a auctor. Phasellus at tempus tellus. Proin ac mi fringilla justo sollicitudin ultrices non in urna. Ut accumsan dui in quam pulvinar lobortis. In hac habitasse platea dictumst. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc molestie ac erat in egestas. Sed tempor purus dui, eget aliquam odio ultricies eget. Vivamus a varius odio, nec vehicula ex. Ut ac neque vitae lacus iaculis malesuada sed vel metus. Duis auctor molestie porta. Vestibulum pellentesque dui mauris, id scelerisque ante egestas eu. Sed sed velit suscipit, tempor nulla ac, molestie tortor. Donec ornare tortor eget ullamcorper facilisis. In sit amet volutpat enim. Praesent mollis aliquam augue non lacinia.'
);

SELECT * FROM documents;