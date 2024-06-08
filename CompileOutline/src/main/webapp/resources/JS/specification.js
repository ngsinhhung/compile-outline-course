
document.addEventListener("DOMContentLoaded", function() {
    // Dữ liệu mẫu cho môn học điều kiện/Requirements
    var sampleRequirementsData = [
        { number: 1, content: "Yêu cầu 1" },
        { number: 2, content: "Yêu cầu 2" },
        { number: 3, content: "Yêu cầu 3" }
    ];

    var requirementsTable = document.getElementById("courseTable").getElementsByTagName("tbody")[0];
    sampleRequirementsData.forEach(function(requirement) {
        var newRow = requirementsTable.insertRow();
        newRow.innerHTML = `
            <td>${requirement.number}</td>
            <td>${requirement.content}</td>
            <td>
                <button type="button" class="btn btn-danger" onclick="deleteRow(this)"><i class="fas fa-trash"></i></button>
                <button type="button" class="btn btn-primary" onclick="editRow(this)"><i class="fas fa-edit"></i></button>
            </td>
        `;
    });

    var sampleObjectivesData = [
        { objective: "Mục tiêu 1", description: "Mô tả mục tiêu 1" },
        { objective: "Mục tiêu 2", description: "Mô tả mục tiêu 2" },
        { objective: "Mục tiêu 3", description: "Mô tả mục tiêu 3" }
    ];

    var objectivesTable = document.getElementById("course-object").getElementsByTagName("tbody")[0];
    sampleObjectivesData.forEach(function(objective) {
        var newRow = objectivesTable.insertRow();
        newRow.innerHTML = `
            <td>${objective.objective}</td>
            <td>${objective.description}</td>
            <td>
                <button type="button" class="btn btn-danger" onclick="deleteRow(this)"><i class="fas fa-trash"></i></button>
                <button type="button" class="btn btn-primary" onclick="editRow(this)"><i class="fas fa-edit"></i></button>
            </td>
        `;
    });
});

const objectiveFormContent = `
    <div class="mb-3">
        <label for="objectiveNumber" class="form-label">Số thứ tự mục tiêu:</label>
        <input type="number" class="form-control" id="objectiveNumber" required>
    </div>
    <div class="mb-3">
        <label for="objectiveDescription" class="form-label">Mô tả mục tiêu:</label>
        <textarea class="form-control" id="objectiveDescription" required></textarea>
    </div>
`;
const courseFormContent = `
<div class="mb-3">
        <label for="objectiveNumber" class="form-label">Số thứ:</label>
        <input type="number" class="form-control" id="courseNumber" required>
    </div>
    <div class="mb-3">
        <label for="objectiveDescription" class="form-label">Yêu cầu mục tiêu:</label>
        <textarea class="form-control" id="courseContent" required></textarea>
    </div>
`
const courseOutComes = `

<div class="mb-3">
        <label for="objectiveNumber" class="form-label">Số thứ:</label>
        <input type="number" class="form-control" id="courseNumberOutCome" required>
    </div>
    <div class="mb-3">
        <label for="objectiveDescription" class="form-label">Yêu cầu đầu ra :</label>
        <textarea class="form-control" id="courseContentOutCome" required></textarea>
    </div>
`
const courseRating = `
<div class="mb-3">
        <label for="objectiveNumber" class="form-label">Thành phần đánh giá</label>
        <input type="text" class="form-control" id="courseObjectRating" required>
    </div>
    <div class="mb-3">
        <label for="objectiveDescription" class="form-label">Bài đánh giá</label>
        <input class="form-control" id="courseExamRating" required></input>
    </div>
     <div class="mb-3">
        <label for="objectiveDescription" class="form-label">Tỉ lệ</label>
        <input class="form-control" id="coursePercent" required></input>
    </div>
 `
function openModal(title, content, saveFunction) {
    document.getElementById('universalModalLabel').innerText = title;
    document.getElementById('universalForm').innerHTML = content;
    document.getElementById('universalSaveButton').onclick = saveFunction;
    let modal = new bootstrap.Modal(document.getElementById('universalModal'));
    modal.show();
}

function saveCourse() {
    var courseNumber = document.getElementById("courseNumber").value;
    var courseContent = document.getElementById("courseContent").value;
    addTableRow(courseNumber, courseContent, "courseTable");
    resetModal();
}

function saveCourseObject() {
    var objectiveNumber = document.getElementById("objectiveNumber").value;
    var objectiveDescription = document.getElementById("objectiveDescription").value;
    addTableRow(objectiveNumber, objectiveDescription, "course-object");
    resetModal();
}

function saveCourseObjectOutCome() {
    var objectiveNumber = document.getElementById("courseNumberOutCome").value;
    var objectiveDescription = document.getElementById("courseContentOutCome").value;
    addTableRow(objectiveNumber, objectiveDescription, "course-outcome");
    resetModal();
}


function saveCourseObjectRating() {
    var objectiveNumber = document.getElementById("courseObjectRating").value;
    var objectiveDescription = document.getElementById("courseExamRating").value;
    var objectRatiting = document.getElementById("coursePercent").value
    addTable2Row(objectiveNumber, objectiveDescription,objectRatiting, "otherTable");

    resetModal();
}

function resetModal() {
    document.getElementById("universalForm").reset();
    let modal = bootstrap.Modal.getInstance(document.getElementById('universalModal'));
    modal.hide();
}

function addTableRow(courseNumber, courseContent, tableId) {
    // Create a new table row
    var newRow = document.createElement("tr");
    newRow.innerHTML = `
        <td>${courseNumber}</td>
        <td>${courseContent}</td>
        <td>
            <button type="button" class="btn btn-danger" onclick="deleteRow(this)"><i class="fas fa-trash"></i></button>
            <button type="button" class="btn btn-primary" onclick="editRow(this)"><i class="fas fa-edit"></i></button>
        </td>
    `;

    // Append the new row to the specified table body
    var tableBody = document.querySelector(`#${tableId} tbody`);
    tableBody.appendChild(newRow);
}

function addTable2Row(courseNumber, courseContent,content2, tableId) {
    // Create a new table row
    var newRow = document.createElement("tr");
    newRow.innerHTML = `
        <td>${courseNumber}</td>
        <td>${courseContent}</td>
        <td>${content2}</td>
        <td>
            <button type="button" class="btn btn-danger" onclick="deleteRow(this)"><i class="fas fa-trash"></i></button>
            <button type="button" class="btn btn-primary" onclick="editRow(this)"><i class="fas fa-edit"></i></button>
        </td>
    `;

    // Append the new row to the specified table body
    var tableBody = document.querySelector(`#${tableId} tbody`);
    tableBody.appendChild(newRow);
}

function deleteRow(btn) {
    var row = btn.parentNode.parentNode;
    row.parentNode.removeChild(row);
}

// Function to edit a row
function editRow(button) {
    var row = button.closest("tr");
    var cells = row.querySelectorAll("td");

    // Loop through each cell
    cells.forEach(function(cell) {
        if (!cell.querySelector(".btn-danger")) {
            var value = cell.textContent.trim();
            cell.innerHTML = `<input type="text" class="form-control" value="${value}">`;
        }
    });

    button.innerHTML = '<i class="fas fa-check"></i>';
    button.classList.remove("btn-primary");
    button.classList.add("btn-success");
    button.setAttribute("onclick", "saveEdit(this)");
}

function saveEdit(button) {
    var row = button.closest("tr");
    var cells = row.querySelectorAll("td");

    // Loop through each cell
    cells.forEach(function(cell) {
        // Skip the last cell with the edit button
        if (!cell.querySelector(".btn-success")) {
            var value = cell.querySelector("input").value;
            cell.textContent = value;
        }
    });

    button.innerHTML = '<i class="fas fa-edit"></i>';
    button.classList.remove("btn-success");
    button.classList.add("btn-primary");
    button.setAttribute("onclick", "editRow(this)");
}

