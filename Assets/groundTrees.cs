using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class groundTrees : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        foreach (Transform tree in transform)
        {
            RaycastHit hit;
            // Cast a ray down to find terrain surface
            if (Physics.Raycast(tree.position, Vector3.down, out hit))
            {
                // Set tree y pos to terrain y pos
                tree.position = new Vector3(tree.position.x, hit.point.y, tree.position.z);
            }
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
