
// modal create the students

document.getElementById("addStudentAccount").addEventListener("click", function() {
    $('#studentAccountModal').modal('show');
});


//active user

document.getElementById("addStudentAccount").addEventListener("click", function() {
    $('#studentAccountModal').modal('show');
});

document.addEventListener('click', function(event) {
    if (event.target.matches('.fa-toggle-on')) {
        event.target.classList.remove('fa-toggle-on', 'text-success');
        event.target.classList.add('fa-toggle-off', 'text-secondary');
        event.target.title = "Activate";
        alert('Account deactivated!');
        event.target.parentElement.previousElementSibling.innerHTML = '<span class="badge badge-danger">Inactive</span>';
    } else if (event.target.matches('.fa-toggle-off')) {
        event.target.classList.remove('fa-toggle-off', 'text-secondary');
        event.target.classList.add('fa-toggle-on', 'text-success');
        event.target.title = "Deactivate";
        alert('Account activated!');
        event.target.parentElement.previousElementSibling.innerHTML = '<span class="badge badge-success">Active</span>';
    }
});


document.querySelectorAll('.fa-trash-alt').forEach(item => {
    item.addEventListener('click', function() {
        alert('Delete action clicked!');
    });
});