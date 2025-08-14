import React from 'react';
import CohortDetails from './CohortDetails';

function App() {
  return (
    <div className="App">
      <h1>Cohort Dashboard</h1>
      <CohortDetails name="React Bootcamp" status="ongoing" mentor="Ananya" />
      <CohortDetails name="Java Spring Batch" status="completed" mentor="Ravi" />
      <CohortDetails name="DevOps Cohort" status="completed" mentor="Sita" />
    </div>
  );
}

export default App;
