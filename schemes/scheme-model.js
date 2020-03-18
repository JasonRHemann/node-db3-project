const db = require("../data/dataConfig.js");
module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove,
  addStep
};

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id })
    .first();
}

function findSteps(id) {
  return db("steps")
    .join("schemes", "schemes.id", "steps.scheme_id")
    .select("steps.step_number", "steps.instructions", "schemes.scheme_name")
    .orderBy("steps.step_number")
    .where("scheme_id", id);
}

function add(scheme) {
  return db("schemes").insert(scheme);
}

function addStep(step, id) {
  return db("steps").insert({ ...step, scheme_id: id });
}

function update(changes, id) {
  return db("schemes")
    .where({ id })
    .update(changes);
}

function remove(id) {
  return db("schemes")
    .where({ id })
    .del();
}
