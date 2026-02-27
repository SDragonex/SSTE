const input = document.getElementById('todo-input');
const addBtn = document.getElementById('add-btn');
const list = document.getElementById('todo-list');
const priority = document.getElementById('priority-select');

addBtn.addEventListener('click', addTodo);
input.addEventListener('keydown', function(e) {
    if (e.key === 'Enter') addTodo();
});

function addTodo() {
    const text = input.value.trim();
    const prio = priority ? priority.value : 'low';
    if (!text) return;
    const li = document.createElement('li');
    li.textContent = text;
    li.classList.add(prio);
    li.addEventListener('click', () => {
        li.classList.toggle('completed');
    });
    const del = document.createElement('button');
    del.textContent = '✖';
    del.className = 'delete-btn';
    del.addEventListener('click', (e) => {
        e.stopPropagation();
        li.remove();
    });
    li.appendChild(del);

    // Vložit podle priority
    let inserted = false;
    const priorities = { high: 3, medium: 2, low: 1 };
    for (const child of list.children) {
        const childPrio = child.classList.contains('high') ? 'high' : child.classList.contains('medium') ? 'medium' : 'low';
        if (priorities[prio] > priorities[childPrio]) {
            list.insertBefore(li, child);
            inserted = true;
            break;
        }
    }
    if (!inserted) {
        list.appendChild(li);
    }
    input.value = '';
    input.focus();
}
