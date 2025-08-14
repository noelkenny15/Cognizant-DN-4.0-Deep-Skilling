import React from 'react';
import styles from './CohortDetails.module.css';

function CohortDetails(props) {
  const { name, status, mentor } = props;

  const statusStyle = {
    color: status === 'ongoing' ? 'green' : 'blue'
  };

  return (
    <div className={styles.box}>
      <h3 style={statusStyle}>Cohort: {name}</h3>
      <dl>
        <dt>Status:</dt>
        <dd>{status}</dd>
        <dt>Mentor:</dt>
        <dd>{mentor}</dd>
      </dl>
    </div>
  );
}

export default CohortDetails;
