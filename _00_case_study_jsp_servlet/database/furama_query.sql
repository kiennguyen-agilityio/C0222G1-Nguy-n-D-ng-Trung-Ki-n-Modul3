USE furama;

SELECT em.*, po.position_name, ed.education_degree_name, di.division_name
FROM employee em JOIN `position` po ON em.position_id = po.position_id
JOIN education_degree ed ON em.education_degree_id = ed.education_degree_id
JOIN division di ON em.division_id = di.division_id;

SELECT * FROM `position`;

SELECT * FROM division;

UPDATE employee SET employee_name = ?, employee_birthday = ?, employee_id_card = ?, 
                    employee_salary = ?, employee_phone = ?, employee_email = ?, 
					employee_address = ?, position_id = ?, education_degree_id = ?,
                    division_id = ?
				WHERE employee_id = ?;

INSERT INTO username
VALUES ('karama2', '123456');

SELECT em.*, po.position_name, ed.education_degree_name, di.division_name
FROM employee em JOIN `position` po ON em.position_id = po.position_id
JOIN education_degree ed ON em.education_degree_id = ed.education_degree_id
JOIN division di ON em.division_id = di.division_id
WHERE employee_id = 3;

INSERT INTO employee (employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id, username)
VALUES ('Kazim Krama', '1993-01-01', '1945312334', 5000 ,'09413232287', 'benzama@gmail.com', 'Quang Binh', 1, 2, 3, 'karama2');

SELECT em.*, po.position_name, ed.education_degree_name, di.division_name
FROM employee em JOIN `position` po ON em.position_id = po.position_id
JOIN education_degree ed ON em.education_degree_id = ed.education_degree_id
JOIN division di ON em.division_id = di.division_id
WHERE employee_name = 3;

SELECT sv.*, st.service_type_name, rt.rent_type_name
FROM service sv
JOIN service_type st ON sv.service_type_id = st.service_type_id
JOIN rent_type rt ON sv.rent_type_id = rt.rent_type_id;

INSERT INTO service (service_name, service_area, service_cost, service_max_people, rent_type_id, service_type_id, stardard_room, description_other_convenience, pool_area, number_of_floors)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? ,?);

SELECT ct.*, ctype.customer_type_name, sv.service_name, `at`.attach_service_name
FROM customer ct
JOIN customer_type ctype ON ct.customer_type_id = ctype.customer_type_id
JOIN contract ctr ON ct.customer_id = ctr.customer_id
JOIN service sv ON ctr.service_id = sv.service_id
JOIN contract_detail ctd ON ctr.contract_id = ctd.contract_id
JOIN attach_service `at` ON ctd.attach_service_id = `at`.attach_service_id;

SELECT ctr.*, (sv.service_cost + ats.attach_service_cost * ats.attach_service_unit * ctd.quantity) AS tong_tien
FROM contract ctr
JOIN service sv ON ctr.service_id = sv.service_id
JOIN contract_detail ctd ON ctr.contract_id = ctd.contract_id
JOIN attach_service ats ON ctd.attach_service_id = ats.attach_service_id;

SELECT * FROM username;

SELECT un.*, po.position_name
FROM username un
JOIN employee ep ON un.username = ep.username
JOIN position po ON ep.position_id = po.position_id;