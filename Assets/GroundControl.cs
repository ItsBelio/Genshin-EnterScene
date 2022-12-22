using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GroundControl : MonoBehaviour
{
    public GameObject Ground1;
    public GameObject Door1;
    public GameObject Ground2;
    public GameObject Door2;
    private Material Mat1;
    private Material Mat2;
    private Material DoorMat1;
    private Material DoorMat2;
    public GameObject RayObj;
    public float Distance1;
    public float Distance2;
    public float SwitchSet;
    public float Speed;
    public float CameraOffset;
    public int GroundSwitch = 1;
    public int DoorSwitch = 1;
    public bool LoadComplete = false;
    public bool stop = false;
    public float scaleSet = 0.5f;
    // Start is called before the first frame update
    void Start()
    {
        Mat1 = Ground1.GetComponent<MeshRenderer>().sharedMaterial;
        Mat2 = Ground2.GetComponent<MeshRenderer>().sharedMaterial;
        DoorMat1 = Door1.GetComponent<MeshRenderer>().sharedMaterial;
        DoorMat2 = Door2.GetComponent<MeshRenderer>().sharedMaterial;
        Door1.SetActive(false);
        Door2.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        Ray ray = new Ray(Camera.main.transform.position, RayObj.transform.position - Camera.main.transform.position);
        if (Physics.Raycast(ray, out RaycastHit hitinfo))
        {
            if (hitinfo.transform.name == "Ground1")
            {
                DoorSwitch = 1;
            }
            else
            {
                DoorSwitch = 2;
            }
        }
        if (LoadComplete == false)
        {
            Ground1.transform.parent.position += new Vector3(0, 0, Speed) * Time.deltaTime;
            Ground2.transform.parent.position += new Vector3(0, 0, Speed) * Time.deltaTime;
            Distance1 = Ground1.transform.position.z - Camera.main.transform.position.z - CameraOffset;
            Distance1 = 1 - ((Distance1 + 10 * scaleSet) / (20 * scaleSet));
            Distance2 = Ground2.transform.position.z - Camera.main.transform.position.z - CameraOffset;
            Distance2 = 1 - ((Distance2 + 10 * scaleSet) / (20 * scaleSet));

            Mat1.SetFloat("_Float0", Distance1);
            Mat2.SetFloat("_Float0", Distance2);

            if (Distance1 > SwitchSet)
            {
                Mat1.SetFloat("_Float0", 0);
                GroundSwitch = 2;
                Ground1.transform.parent.position = Ground2.transform.parent.position + new Vector3(0, 0, 20 * scaleSet);

            }
            if (Distance2 > SwitchSet)
            {
                Mat2.SetFloat("_Float0", 0);
                GroundSwitch = 1;
                Ground2.transform.parent.position = Ground1.transform.parent.position + new Vector3(0, 0, 20 * scaleSet);
            }
        }
        else
        {
            if (DoorSwitch == 1)
            {
                if (Distance1 < .7)
                {
                    Ground1.transform.parent.position += new Vector3(0, 0, Speed) * Time.deltaTime;
                    Distance1 = Ground1.transform.position.z - Camera.main.transform.position.z;
                    Distance1 = 1 - ((Distance1 + 10 * scaleSet) / 20 * scaleSet);
                }
                Mat1.SetFloat("_Float0", Mat1.GetFloat("_Float0") + .2f * Time.deltaTime);
                if (Mat1.GetFloat("_Float0") >= 0.9)
                {
                    DoorMat1.SetFloat("_Float0", DoorMat1.GetFloat("_Float0") + 1.10f * Time.deltaTime);
                }

            }
            else
            {
                if (Distance2 < .7)
                {
                    Ground2.transform.parent.position += new Vector3(0, 0, Speed) * Time.deltaTime;
                    Distance2 = Ground2.transform.position.z - Camera.main.transform.position.z;
                    Distance2 = 1 - ((Distance2 + 10 * scaleSet) / 20 * scaleSet);
                }
                Mat2.SetFloat("_Float0", Mat2.GetFloat("_Float0") + .2f * Time.deltaTime);
                if (Mat2.GetFloat("_Float0") >= 0.9)
                {
                    DoorMat2.SetFloat("_Float0", DoorMat2.GetFloat("_Float0") + 1.10f * Time.deltaTime);
                }
            }
        }
    }
    void OnGUI()
    {
        if (GUI.Button(new Rect(20, 20, 200, 100), "加载完成"))
        {
            LoadComplete = true;
            if (DoorSwitch == 1)
            {
                DoorMat1.SetFloat("_Float0", 0);
                Door1.SetActive(true);
            }
            else
            {
                DoorMat2.SetFloat("_Float0", 0);
                Door2.SetActive(true);
            }
        }
    }
}
